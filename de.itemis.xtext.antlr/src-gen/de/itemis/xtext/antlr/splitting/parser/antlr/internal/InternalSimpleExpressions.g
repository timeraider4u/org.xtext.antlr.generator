/*
* generated by Xtext
*/
grammar InternalSimpleExpressions;

options {
	superClass=AbstractInternalAntlrParser;
	
}

@lexer::header {
package de.itemis.xtext.antlr.splitting.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package de.itemis.xtext.antlr.splitting.parser.antlr.internal; 

import java.io.InputStream;
import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.xtext.parsetree.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import org.eclipse.xtext.conversion.ValueConverterException;
import de.itemis.xtext.antlr.splitting.services.SimpleExpressionsGrammarAccess;

}

@parser::members {

 	private SimpleExpressionsGrammarAccess grammarAccess;
 	
    public InternalSimpleExpressionsParser(TokenStream input, IAstFactory factory, SimpleExpressionsGrammarAccess grammarAccess) {
        this(input);
        this.factory = factory;
        registerRules(grammarAccess.getGrammar());
        this.grammarAccess = grammarAccess;
    }
    
    @Override
    protected InputStream getTokenFile() {
    	ClassLoader classLoader = getClass().getClassLoader();
    	return classLoader.getResourceAsStream("de/itemis/xtext/antlr/splitting/parser/antlr/internal/InternalSimpleExpressions.tokens");
    }
    
    @Override
    protected String getFirstRuleName() {
    	return "IfCondition";	
   	}
   	
   	@Override
   	protected SimpleExpressionsGrammarAccess getGrammarAccess() {
   		return grammarAccess;
   	}
}

@rulecatch { 
    catch (RecognitionException re) { 
        recover(input,re); 
        appendSkippedTokens();
    } 
}




// Entry rule entryRuleIfCondition
entryRuleIfCondition returns [EObject current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getIfConditionRule(), currentNode); }
	 iv_ruleIfCondition=ruleIfCondition 
	 { $current=$iv_ruleIfCondition.current; } 
	 EOF 
;

// Rule IfCondition
ruleIfCondition returns [EObject current=null] 
    @init { @SuppressWarnings("unused") EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
((
(
		lv_elseif_0_0=	'else' 
    {
        createLeafNode(grammarAccess.getIfConditionAccess().getElseifElseKeyword_0_0(), "elseif"); 
    }
 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getIfConditionRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "elseif", true, "else", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }

)
)?	'if' 
    {
        createLeafNode(grammarAccess.getIfConditionAccess().getIfKeyword_1(), null); 
    }
	'(' 
    {
        createLeafNode(grammarAccess.getIfConditionAccess().getLeftParenthesisKeyword_2(), null); 
    }
(
(
		{ 
	        currentNode=createCompositeNode(grammarAccess.getIfConditionAccess().getConditionExpressionParserRuleCall_3_0(), currentNode); 
	    }
		lv_condition_3_0=ruleExpression		{
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getIfConditionRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode.getParent(), $current);
	        }
	        try {
	       		set(
	       			$current, 
	       			"condition",
	        		lv_condition_3_0, 
	        		"Expression", 
	        		currentNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	        currentNode = currentNode.getParent();
	    }

)
)	')' 
    {
        createLeafNode(grammarAccess.getIfConditionAccess().getRightParenthesisKeyword_4(), null); 
    }
	'{' 
    {
        createLeafNode(grammarAccess.getIfConditionAccess().getLeftCurlyBracketKeyword_5(), null); 
    }
)
;





// Entry rule entryRuleExpression
entryRuleExpression returns [EObject current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getExpressionRule(), currentNode); }
	 iv_ruleExpression=ruleExpression 
	 { $current=$iv_ruleExpression.current; } 
	 EOF 
;

// Rule Expression
ruleExpression returns [EObject current=null] 
    @init { @SuppressWarnings("unused") EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(
    { 
        currentNode=createCompositeNode(grammarAccess.getExpressionAccess().getAndExpressionParserRuleCall_0(), currentNode); 
    }
    this_AndExpression_0=ruleAndExpression
    { 
        $current = $this_AndExpression_0.current; 
        currentNode = currentNode.getParent();
    }
((
    { 
        temp=factory.create(grammarAccess.getExpressionAccess().getOrExpressionLeftAction_1_0().getType().getClassifier());
        try {
        	factory.set(temp, "left", $current, null /*ParserRule*/, currentNode);
        } catch(ValueConverterException vce) {
        	handleValueConverterException(vce);
        }
        $current = temp; 
        temp = null;
        CompositeNode newNode = createCompositeNode(grammarAccess.getExpressionAccess().getOrExpressionLeftAction_1_0(), currentNode.getParent());
    newNode.getChildren().add(currentNode);
    moveLookaheadInfo(currentNode, newNode);
    currentNode = newNode; 
        associateNodeWithAstElement(currentNode, $current); 
    }
)	'||' 
    {
        createLeafNode(grammarAccess.getExpressionAccess().getVerticalLineVerticalLineKeyword_1_1(), null); 
    }
(
(
		{ 
	        currentNode=createCompositeNode(grammarAccess.getExpressionAccess().getRightAndExpressionParserRuleCall_1_2_0(), currentNode); 
	    }
		lv_right_3_0=ruleAndExpression		{
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getExpressionRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode.getParent(), $current);
	        }
	        try {
	       		set(
	       			$current, 
	       			"right",
	        		lv_right_3_0, 
	        		"AndExpression", 
	        		currentNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	        currentNode = currentNode.getParent();
	    }

)
))*)
;





// Entry rule entryRuleAndExpression
entryRuleAndExpression returns [EObject current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getAndExpressionRule(), currentNode); }
	 iv_ruleAndExpression=ruleAndExpression 
	 { $current=$iv_ruleAndExpression.current; } 
	 EOF 
;

// Rule AndExpression
ruleAndExpression returns [EObject current=null] 
    @init { @SuppressWarnings("unused") EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(
    { 
        currentNode=createCompositeNode(grammarAccess.getAndExpressionAccess().getComparisonParserRuleCall_0(), currentNode); 
    }
    this_Comparison_0=ruleComparison
    { 
        $current = $this_Comparison_0.current; 
        currentNode = currentNode.getParent();
    }
((
    { 
        temp=factory.create(grammarAccess.getAndExpressionAccess().getAndExpressionLeftAction_1_0().getType().getClassifier());
        try {
        	factory.set(temp, "left", $current, null /*ParserRule*/, currentNode);
        } catch(ValueConverterException vce) {
        	handleValueConverterException(vce);
        }
        $current = temp; 
        temp = null;
        CompositeNode newNode = createCompositeNode(grammarAccess.getAndExpressionAccess().getAndExpressionLeftAction_1_0(), currentNode.getParent());
    newNode.getChildren().add(currentNode);
    moveLookaheadInfo(currentNode, newNode);
    currentNode = newNode; 
        associateNodeWithAstElement(currentNode, $current); 
    }
)	'&&' 
    {
        createLeafNode(grammarAccess.getAndExpressionAccess().getAmpersandAmpersandKeyword_1_1(), null); 
    }
(
(
		{ 
	        currentNode=createCompositeNode(grammarAccess.getAndExpressionAccess().getRightComparisonParserRuleCall_1_2_0(), currentNode); 
	    }
		lv_right_3_0=ruleComparison		{
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getAndExpressionRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode.getParent(), $current);
	        }
	        try {
	       		set(
	       			$current, 
	       			"right",
	        		lv_right_3_0, 
	        		"Comparison", 
	        		currentNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	        currentNode = currentNode.getParent();
	    }

)
))*)
;





// Entry rule entryRuleComparison
entryRuleComparison returns [EObject current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getComparisonRule(), currentNode); }
	 iv_ruleComparison=ruleComparison 
	 { $current=$iv_ruleComparison.current; } 
	 EOF 
;

// Rule Comparison
ruleComparison returns [EObject current=null] 
    @init { @SuppressWarnings("unused") EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(
    { 
        currentNode=createCompositeNode(grammarAccess.getComparisonAccess().getPrefixExpressionParserRuleCall_0(), currentNode); 
    }
    this_PrefixExpression_0=rulePrefixExpression
    { 
        $current = $this_PrefixExpression_0.current; 
        currentNode = currentNode.getParent();
    }
((
    { 
        temp=factory.create(grammarAccess.getComparisonAccess().getComparisonLeftAction_1_0().getType().getClassifier());
        try {
        	factory.set(temp, "left", $current, null /*ParserRule*/, currentNode);
        } catch(ValueConverterException vce) {
        	handleValueConverterException(vce);
        }
        $current = temp; 
        temp = null;
        CompositeNode newNode = createCompositeNode(grammarAccess.getComparisonAccess().getComparisonLeftAction_1_0(), currentNode.getParent());
    newNode.getChildren().add(currentNode);
    moveLookaheadInfo(currentNode, newNode);
    currentNode = newNode; 
        associateNodeWithAstElement(currentNode, $current); 
    }
)(
(
(
		lv_operator_2_1=	'==' 
    {
        createLeafNode(grammarAccess.getComparisonAccess().getOperatorEqualsSignEqualsSignKeyword_1_1_0_0(), "operator"); 
    }
 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getComparisonRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "operator", lv_operator_2_1, null, lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }

    |		lv_operator_2_2=	'<=' 
    {
        createLeafNode(grammarAccess.getComparisonAccess().getOperatorLessThanSignEqualsSignKeyword_1_1_0_1(), "operator"); 
    }
 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getComparisonRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "operator", lv_operator_2_2, null, lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }

    |		lv_operator_2_3=	'>=' 
    {
        createLeafNode(grammarAccess.getComparisonAccess().getOperatorGreaterThanSignEqualsSignKeyword_1_1_0_2(), "operator"); 
    }
 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getComparisonRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "operator", lv_operator_2_3, null, lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }

)

)
)(
(
		{ 
	        currentNode=createCompositeNode(grammarAccess.getComparisonAccess().getRightPrefixExpressionParserRuleCall_1_2_0(), currentNode); 
	    }
		lv_right_3_0=rulePrefixExpression		{
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getComparisonRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode.getParent(), $current);
	        }
	        try {
	       		set(
	       			$current, 
	       			"right",
	        		lv_right_3_0, 
	        		"PrefixExpression", 
	        		currentNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	        currentNode = currentNode.getParent();
	    }

)
))?)
;





// Entry rule entryRulePrefixExpression
entryRulePrefixExpression returns [EObject current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getPrefixExpressionRule(), currentNode); }
	 iv_rulePrefixExpression=rulePrefixExpression 
	 { $current=$iv_rulePrefixExpression.current; } 
	 EOF 
;

// Rule PrefixExpression
rulePrefixExpression returns [EObject current=null] 
    @init { @SuppressWarnings("unused") EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(((
    { 
        temp=factory.create(grammarAccess.getPrefixExpressionAccess().getNotExpressionAction_0_0().getType().getClassifier());
        $current = temp; 
        temp = null;
        CompositeNode newNode = createCompositeNode(grammarAccess.getPrefixExpressionAccess().getNotExpressionAction_0_0(), currentNode.getParent());
    newNode.getChildren().add(currentNode);
    moveLookaheadInfo(currentNode, newNode);
    currentNode = newNode; 
        associateNodeWithAstElement(currentNode, $current); 
    }
)	'!' 
    {
        createLeafNode(grammarAccess.getPrefixExpressionAccess().getExclamationMarkKeyword_0_1(), null); 
    }
(
(
		{ 
	        currentNode=createCompositeNode(grammarAccess.getPrefixExpressionAccess().getExpressionAtomParserRuleCall_0_2_0(), currentNode); 
	    }
		lv_expression_2_0=ruleAtom		{
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getPrefixExpressionRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode.getParent(), $current);
	        }
	        try {
	       		set(
	       			$current, 
	       			"expression",
	        		lv_expression_2_0, 
	        		"Atom", 
	        		currentNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	        currentNode = currentNode.getParent();
	    }

)
))
    |
    { 
        currentNode=createCompositeNode(grammarAccess.getPrefixExpressionAccess().getAtomParserRuleCall_1(), currentNode); 
    }
    this_Atom_3=ruleAtom
    { 
        $current = $this_Atom_3.current; 
        currentNode = currentNode.getParent();
    }
)
;





// Entry rule entryRuleAtom
entryRuleAtom returns [EObject current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getAtomRule(), currentNode); }
	 iv_ruleAtom=ruleAtom 
	 { $current=$iv_ruleAtom.current; } 
	 EOF 
;

// Rule Atom
ruleAtom returns [EObject current=null] 
    @init { @SuppressWarnings("unused") EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(
    { 
        currentNode=createCompositeNode(grammarAccess.getAtomAccess().getParenthesizedExpressionParserRuleCall_0(), currentNode); 
    }
    this_ParenthesizedExpression_0=ruleParenthesizedExpression
    { 
        $current = $this_ParenthesizedExpression_0.current; 
        currentNode = currentNode.getParent();
    }

    |
    { 
        currentNode=createCompositeNode(grammarAccess.getAtomAccess().getNumberLiteralParserRuleCall_1(), currentNode); 
    }
    this_NumberLiteral_1=ruleNumberLiteral
    { 
        $current = $this_NumberLiteral_1.current; 
        currentNode = currentNode.getParent();
    }

    |
    { 
        currentNode=createCompositeNode(grammarAccess.getAtomAccess().getMethodCallParserRuleCall_2(), currentNode); 
    }
    this_MethodCall_2=ruleMethodCall
    { 
        $current = $this_MethodCall_2.current; 
        currentNode = currentNode.getParent();
    }
)
;





// Entry rule entryRuleNumberLiteral
entryRuleNumberLiteral returns [EObject current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getNumberLiteralRule(), currentNode); }
	 iv_ruleNumberLiteral=ruleNumberLiteral 
	 { $current=$iv_ruleNumberLiteral.current; } 
	 EOF 
;

// Rule NumberLiteral
ruleNumberLiteral returns [EObject current=null] 
    @init { @SuppressWarnings("unused") EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(
(
		lv_value_0_0=RULE_INT
		{
			createLeafNode(grammarAccess.getNumberLiteralAccess().getValueINTTerminalRuleCall_0(), "value"); 
		}
		{
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getNumberLiteralRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        try {
	       		set(
	       			$current, 
	       			"value",
	        		lv_value_0_0, 
	        		"INT", 
	        		lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }

)
)
;





// Entry rule entryRuleParenthesizedExpression
entryRuleParenthesizedExpression returns [EObject current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getParenthesizedExpressionRule(), currentNode); }
	 iv_ruleParenthesizedExpression=ruleParenthesizedExpression 
	 { $current=$iv_ruleParenthesizedExpression.current; } 
	 EOF 
;

// Rule ParenthesizedExpression
ruleParenthesizedExpression returns [EObject current=null] 
    @init { @SuppressWarnings("unused") EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(	'(' 
    {
        createLeafNode(grammarAccess.getParenthesizedExpressionAccess().getLeftParenthesisKeyword_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getParenthesizedExpressionAccess().getExpressionParserRuleCall_1(), currentNode); 
    }
    this_Expression_1=ruleExpression
    { 
        $current = $this_Expression_1.current; 
        currentNode = currentNode.getParent();
    }
	')' 
    {
        createLeafNode(grammarAccess.getParenthesizedExpressionAccess().getRightParenthesisKeyword_2(), null); 
    }
)
;





// Entry rule entryRuleMethodCall
entryRuleMethodCall returns [EObject current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getMethodCallRule(), currentNode); }
	 iv_ruleMethodCall=ruleMethodCall 
	 { $current=$iv_ruleMethodCall.current; } 
	 EOF 
;

// Rule MethodCall
ruleMethodCall returns [EObject current=null] 
    @init { @SuppressWarnings("unused") EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(
(
		{ 
	        currentNode=createCompositeNode(grammarAccess.getMethodCallAccess().getValueMethodCallLiteralParserRuleCall_0(), currentNode); 
	    }
		lv_value_0_0=ruleMethodCallLiteral		{
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getMethodCallRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode.getParent(), $current);
	        }
	        try {
	       		set(
	       			$current, 
	       			"value",
	        		lv_value_0_0, 
	        		"MethodCallLiteral", 
	        		currentNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	        currentNode = currentNode.getParent();
	    }

)
)
;





// Entry rule entryRuleMethodCallLiteral
entryRuleMethodCallLiteral returns [String current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getMethodCallLiteralRule(), currentNode); } 
	 iv_ruleMethodCallLiteral=ruleMethodCallLiteral 
	 { $current=$iv_ruleMethodCallLiteral.current.getText(); }  
	 EOF 
;

// Rule MethodCallLiteral
ruleMethodCallLiteral returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] 
    @init { setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
	    lastConsumedNode = currentNode;
    }:
(
    { 
        currentNode=createCompositeNode(grammarAccess.getMethodCallLiteralAccess().getFQNParserRuleCall_0(), currentNode); 
    }
    this_FQN_0=ruleFQN    {
		$current.merge(this_FQN_0);
    }

    { 
        currentNode = currentNode.getParent();
    }
(
	kw='(' 
    {
        $current.merge(kw);
        createLeafNode(grammarAccess.getMethodCallLiteralAccess().getLeftParenthesisKeyword_1_0(), null); 
    }
(
    { 
        currentNode=createCompositeNode(grammarAccess.getMethodCallLiteralAccess().getArgumentParserRuleCall_1_1_0(), currentNode); 
    }
    this_Argument_2=ruleArgument    {
		$current.merge(this_Argument_2);
    }

    { 
        currentNode = currentNode.getParent();
    }
(
	kw=',' 
    {
        $current.merge(kw);
        createLeafNode(grammarAccess.getMethodCallLiteralAccess().getCommaKeyword_1_1_1_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getMethodCallLiteralAccess().getArgumentParserRuleCall_1_1_1_1(), currentNode); 
    }
    this_Argument_4=ruleArgument    {
		$current.merge(this_Argument_4);
    }

    { 
        currentNode = currentNode.getParent();
    }
)*)?
	kw=')' 
    {
        $current.merge(kw);
        createLeafNode(grammarAccess.getMethodCallLiteralAccess().getRightParenthesisKeyword_1_2(), null); 
    }
(
	kw='.' 
    {
        $current.merge(kw);
        createLeafNode(grammarAccess.getMethodCallLiteralAccess().getFullStopKeyword_1_3_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getMethodCallLiteralAccess().getMethodCallLiteralParserRuleCall_1_3_1(), currentNode); 
    }
    this_MethodCallLiteral_7=ruleMethodCallLiteral    {
		$current.merge(this_MethodCallLiteral_7);
    }

    { 
        currentNode = currentNode.getParent();
    }
)?)?)
    ;





// Entry rule entryRuleArgument
entryRuleArgument returns [String current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getArgumentRule(), currentNode); } 
	 iv_ruleArgument=ruleArgument 
	 { $current=$iv_ruleArgument.current.getText(); }  
	 EOF 
;

// Rule Argument
ruleArgument returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] 
    @init { setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
	    lastConsumedNode = currentNode;
    }:
(
    { 
        currentNode=createCompositeNode(grammarAccess.getArgumentAccess().getMethodCallLiteralParserRuleCall_0(), currentNode); 
    }
    this_MethodCallLiteral_0=ruleMethodCallLiteral    {
		$current.merge(this_MethodCallLiteral_0);
    }

    { 
        currentNode = currentNode.getParent();
    }

    |    this_INT_1=RULE_INT    {
		$current.merge(this_INT_1);
    }

    { 
    createLeafNode(grammarAccess.getArgumentAccess().getINTTerminalRuleCall_1(), null); 
    }
)
    ;





// Entry rule entryRuleFQN
entryRuleFQN returns [String current=null] 
	:
	{ currentNode = createCompositeNode(grammarAccess.getFQNRule(), currentNode); } 
	 iv_ruleFQN=ruleFQN 
	 { $current=$iv_ruleFQN.current.getText(); }  
	 EOF 
;

// Rule FQN
ruleFQN returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] 
    @init { setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
	    lastConsumedNode = currentNode;
    }:
(    this_ID_0=RULE_ID    {
		$current.merge(this_ID_0);
    }

    { 
    createLeafNode(grammarAccess.getFQNAccess().getIDTerminalRuleCall_0(), null); 
    }
(
	kw='.' 
    {
        $current.merge(kw);
        createLeafNode(grammarAccess.getFQNAccess().getFullStopKeyword_1_0(), null); 
    }
    this_ID_2=RULE_ID    {
		$current.merge(this_ID_2);
    }

    { 
    createLeafNode(grammarAccess.getFQNAccess().getIDTerminalRuleCall_1_1(), null); 
    }
)*)
    ;





RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' ('b'|'t'|'n'|'f'|'r'|'"'|'\''|'\\')|~(('\\'|'"')))* '"'|'\'' ('\\' ('b'|'t'|'n'|'f'|'r'|'"'|'\''|'\\')|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;


