/*******************************************************************************
 * Copyright (c) 2009 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package de.itemis.xtext.antlr.ex.rt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Set;

import org.eclipse.xpand2.XpandExecutionContext;
import org.eclipse.xtext.Grammar;
import org.eclipse.xtext.GrammarUtil;
import org.eclipse.xtext.generator.BindFactory;
import org.eclipse.xtext.generator.Binding;
import org.eclipse.xtext.generator.Generator;
import org.eclipse.xtext.parser.ITokenToStringConverter;
import org.eclipse.xtext.parser.antlr.AntlrTokenDefProvider;
import org.eclipse.xtext.parser.antlr.AntlrTokenToStringConverter;
import org.eclipse.xtext.parser.antlr.IAntlrParser;
import org.eclipse.xtext.parser.antlr.IAntlrTokenFileProvider;
import org.eclipse.xtext.parser.antlr.ITokenDefProvider;
import org.eclipse.xtext.parser.antlr.Lexer;

import de.itemis.xtext.antlr.AntlrToolRunner;
import de.itemis.xtext.antlr.ex.common.AbstractAntlrGeneratorFragmentEx;
import de.itemis.xtext.antlr.ex.common.KeywordHelper;
import de.itemis.xtext.antlr.ex.common.MutableTokenDefProvider;

/**
 * Converts the Xtext grammar to an AntLR grammar runs the AntLR generator. 
 * Additionally generates some parser/lexer related services
 *  
 * @author Sebastian Zarnekow - Initial contribution and API
 */
public class AntlrGeneratorFragment extends AbstractAntlrGeneratorFragmentEx {
	
	@Override
	public void generate(final Grammar grammar, XpandExecutionContext ctx) {
		KeywordHelper helper = new KeywordHelper(grammar);
		super.generate(grammar, ctx);
		final String srcGenPath = ctx.getOutput().getOutlet(Generator.SRC_GEN).getPath();
		String libPath = srcGenPath + "/" + getFragmentHelper().getLexerGrammarFileName(grammar).replace('.', '/');
		libPath = libPath.substring(0, libPath.lastIndexOf('/'));
		AntlrToolRunner.runWithParams(srcGenPath+"/"+getFragmentHelper().getLexerGrammarFileName(grammar).replace('.', '/')+".g");
		AntlrToolRunner.runWithParams(srcGenPath+"/"+getFragmentHelper().getParserGrammarFileName(grammar).replace('.', '/')+".g", "-lib", libPath);
		
		MutableTokenDefProvider provider = new MutableTokenDefProvider();
		provider.setAntlrTokenFileProvider(new IAntlrTokenFileProvider() {
			public InputStream getAntlrTokenFile() {
				try {
					return new FileInputStream(srcGenPath+"/"+getFragmentHelper().getLexerGrammarFileName(grammar).replace('.', '/') + ".tokens");
				}
				catch (FileNotFoundException e) {
					throw new RuntimeException();
				}
			}
		});
		for(Map.Entry<Integer, String> entry: provider.getTokenDefMap().entrySet()) {
			String value = entry.getValue();
			if(helper.isKeywordRule(value)) {
				entry.setValue("'" + helper.getKeywordValue(value) + "'");
			}
		}
		try {
			provider.writeTokenFile(new PrintWriter(new File(srcGenPath+"/"+getFragmentHelper().getParserGrammarFileName(grammar).replace('.', '/') + ".tokens")));
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
		helper.discardHelper(grammar);
	}
	
	@Override
	public String[] getExportedPackagesRt(Grammar grammar) {
		return new String[]{
				GrammarUtil.getNamespace(grammar) + ".parser.antlr",
				GrammarUtil.getNamespace(grammar) + ".parser.antlr.internal"
		};
	}
	
	@Override
	public String[] getRequiredBundlesRt(Grammar grammar) {
		return new String[]{
				"org.antlr.runtime"
		};
	}
	
	@Override
	public Set<Binding> getGuiceBindingsRt(Grammar grammar) {
		return new BindFactory()
			.addTypeToType(IAntlrParser.class.getName(),getFragmentHelper().getParserClassName(grammar))
			.addTypeToType(ITokenToStringConverter.class.getName(),AntlrTokenToStringConverter.class.getName())
			.addTypeToType(IAntlrTokenFileProvider.class.getName(),getFragmentHelper().getAntlrTokenFileProviderClassName(grammar))
			.addTypeToType(Lexer.class.getName(), getFragmentHelper().getLexerClassName(grammar))
			.addTypeToProviderInstance(getFragmentHelper().getLexerClassName(grammar), "org.eclipse.xtext.parser.antlr.LexerProvider.create(" + getFragmentHelper().getLexerClassName(grammar) + ".class)")
			.addConfiguredBinding("RuntimeLexer", 
					"binder.bind(" + Lexer.class.getName() + ".class)"+
					".annotatedWith(com.google.inject.name.Names.named(" +
					"org.eclipse.xtext.parser.antlr.LexerBindings.RUNTIME" +
					")).to(" + getFragmentHelper().getLexerClassName(grammar) +".class)")
			.addTypeToType(ITokenDefProvider.class.getName(),AntlrTokenDefProvider.class.getName())
			.getBindings();
	}

	@Override
	public Set<Binding> getGuiceBindingsUi(Grammar grammar) {
		return new BindFactory()
			.addTypeToType("org.eclipse.jface.text.rules.ITokenScanner","org.eclipse.xtext.ui.common.editor.syntaxcoloring.antlr.AntlrTokenScanner")
			.addTypeToType("org.eclipse.xtext.ui.common.editor.contentassist.IProposalConflictHelper", "org.eclipse.xtext.ui.common.editor.contentassist.antlr.AntlrProposalConflictHelper")
			.addTypeToType("org.eclipse.xtext.ui.core.editor.IDamagerRepairer", "org.eclipse.xtext.ui.core.editor.XtextDamagerRepairer")
			.addConfiguredBinding("HighlightingLexer", 
					"binder.bind(" + Lexer.class.getName() + ".class)"+
					".annotatedWith(com.google.inject.name.Names.named(" +
					"org.eclipse.xtext.ui.core.LexerUIBindings.HIGHLIGHTING" +
					")).to(" + getFragmentHelper().getLexerClassName(grammar) +".class)")
			.getBindings();
	}
	
}
