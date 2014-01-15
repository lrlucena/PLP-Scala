package plp.expressions1

import org.antlr.v4.runtime.ANTLRInputStream
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.tree.ParseTreeWalker

import plp.expressions1.parser.{ E1, E1Lexer, E1Parser }

object Teste extends App {
  val resultado = programa("""1+2 +3+length "ok"""")
  val p = ConstrutorPrograma.criarPrograma(resultado).executar
  println(p)

  def programa(codigo: String) = {
    val input = new ANTLRInputStream(codigo)
    val lexer = new E1Lexer(input)
    val tokens = new CommonTokenStream(lexer)
    val parser = new E1Parser(tokens)
    val tree = parser.programa()
    val walker = new ParseTreeWalker()
    val listener = new E1()
    walker.walk(listener, tree)
    listener.programa
  }
}