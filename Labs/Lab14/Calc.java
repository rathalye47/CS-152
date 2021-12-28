// Code taken from
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.InputStream;

public class Calc {
    public static void main(String[] args) throws Exception {
        String inputFile = "testWithId.expr";
        if (args.length>0) inputFile = args[0];
        InputStream is = System.in;
        if (inputFile!=null) is = new FileInputStream(inputFile);

        CharStream stream = CharStreams.fromStream(is);
        ExprLexer lexer = new ExprLexer(stream);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        ExprParser parser = new ExprParser(tokens);
        ParseTree tree = parser.prog(); // parse

        EvalVisitor eval = new EvalVisitor();
        eval.visit(tree);
    }
}
