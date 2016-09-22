// Generated from csce322hw001pt01.g4 by ANTLR 4.5.3
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class csce322hw001pt01Lexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.5.3", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, SECTIONBEGIN=4, SECTIONEND=5, GAMEBEGIN=6, GAMEEND=7, 
		TITLESYMBOL=8, LISTBEGIN=9, LISTEND=10, SECTIONNAME=11, NUMBER=12, DASH=13, 
		ENDROW=14, ASSIGNVALUE=15, WS=16;
	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"T__0", "T__1", "T__2", "SECTIONBEGIN", "SECTIONEND", "GAMEBEGIN", "GAMEEND", 
		"TITLESYMBOL", "LISTBEGIN", "LISTEND", "SECTIONNAME", "NUMBER", "DASH", 
		"ENDROW", "ASSIGNVALUE", "WS"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'<'", "'>'", "'^'", "'%section%'", "'$section'", "'%game%'", "'$game'", 
		"'%title%'", null, null, null, null, "'-'", "'/n'", "'=>'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, null, null, null, "SECTIONBEGIN", "SECTIONEND", "GAMEBEGIN", "GAMEEND", 
		"TITLESYMBOL", "LISTBEGIN", "LISTEND", "SECTIONNAME", "NUMBER", "DASH", 
		"ENDROW", "ASSIGNVALUE", "WS"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public csce322hw001pt01Lexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "csce322hw001pt01.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\2\22\u0097\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\3\2\3"+
		"\2\3\3\3\3\3\4\3\4\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\6\3\6\3\6"+
		"\3\6\3\6\3\6\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\b\3\b\3\b\3\b\3"+
		"\b\3\b\3\t\3\t\3\t\3\t\3\t\3\t\3\t\3\t\3\n\3\n\3\n\3\n\3\n\3\n\3\n\3\n"+
		"\3\n\3\n\3\n\3\n\3\n\5\n_\n\n\3\n\3\n\3\13\3\13\3\13\3\13\3\13\3\13\3"+
		"\13\3\13\3\13\3\13\3\13\3\13\3\13\5\13p\n\13\3\f\3\f\3\f\3\f\3\f\3\f\3"+
		"\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\5\f\u0082\n\f\3\r\6\r\u0085\n\r"+
		"\r\r\16\r\u0086\3\16\3\16\3\17\3\17\3\17\3\20\3\20\3\20\3\21\6\21\u0092"+
		"\n\21\r\21\16\21\u0093\3\21\3\21\2\2\22\3\3\5\4\7\5\t\6\13\7\r\b\17\t"+
		"\21\n\23\13\25\f\27\r\31\16\33\17\35\20\37\21!\22\3\2\4\3\2\62;\5\2\13"+
		"\f\17\17\"\"\u009c\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13"+
		"\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2"+
		"\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2"+
		"!\3\2\2\2\3#\3\2\2\2\5%\3\2\2\2\7\'\3\2\2\2\t)\3\2\2\2\13\63\3\2\2\2\r"+
		"<\3\2\2\2\17C\3\2\2\2\21I\3\2\2\2\23Q\3\2\2\2\25b\3\2\2\2\27\u0081\3\2"+
		"\2\2\31\u0084\3\2\2\2\33\u0088\3\2\2\2\35\u008a\3\2\2\2\37\u008d\3\2\2"+
		"\2!\u0091\3\2\2\2#$\7>\2\2$\4\3\2\2\2%&\7@\2\2&\6\3\2\2\2\'(\7`\2\2(\b"+
		"\3\2\2\2)*\7\'\2\2*+\7u\2\2+,\7g\2\2,-\7e\2\2-.\7v\2\2./\7k\2\2/\60\7"+
		"q\2\2\60\61\7p\2\2\61\62\7\'\2\2\62\n\3\2\2\2\63\64\7&\2\2\64\65\7u\2"+
		"\2\65\66\7g\2\2\66\67\7e\2\2\678\7v\2\289\7k\2\29:\7q\2\2:;\7p\2\2;\f"+
		"\3\2\2\2<=\7\'\2\2=>\7i\2\2>?\7c\2\2?@\7o\2\2@A\7g\2\2AB\7\'\2\2B\16\3"+
		"\2\2\2CD\7&\2\2DE\7i\2\2EF\7c\2\2FG\7o\2\2GH\7g\2\2H\20\3\2\2\2IJ\7\'"+
		"\2\2JK\7v\2\2KL\7k\2\2LM\7v\2\2MN\7n\2\2NO\7g\2\2OP\7\'\2\2P\22\3\2\2"+
		"\2Q^\7\'\2\2RS\7u\2\2ST\7r\2\2TU\7c\2\2UV\7e\2\2VW\7g\2\2W_\7u\2\2XY\7"+
		"x\2\2YZ\7c\2\2Z[\7n\2\2[\\\7w\2\2\\]\7g\2\2]_\7u\2\2^R\3\2\2\2^X\3\2\2"+
		"\2_`\3\2\2\2`a\7\'\2\2a\24\3\2\2\2bo\7&\2\2cd\7u\2\2de\7r\2\2ef\7c\2\2"+
		"fg\7e\2\2gh\7g\2\2hp\7u\2\2ij\7x\2\2jk\7c\2\2kl\7n\2\2lm\7w\2\2mn\7g\2"+
		"\2np\7u\2\2oc\3\2\2\2oi\3\2\2\2p\26\3\2\2\2qr\7U\2\2rs\7r\2\2st\7c\2\2"+
		"tu\7e\2\2uv\7g\2\2v\u0082\7u\2\2wx\7X\2\2xy\7c\2\2yz\7n\2\2z{\7w\2\2{"+
		"|\7g\2\2|\u0082\7u\2\2}~\7I\2\2~\177\7c\2\2\177\u0080\7o\2\2\u0080\u0082"+
		"\7g\2\2\u0081q\3\2\2\2\u0081w\3\2\2\2\u0081}\3\2\2\2\u0082\30\3\2\2\2"+
		"\u0083\u0085\t\2\2\2\u0084\u0083\3\2\2\2\u0085\u0086\3\2\2\2\u0086\u0084"+
		"\3\2\2\2\u0086\u0087\3\2\2\2\u0087\32\3\2\2\2\u0088\u0089\7/\2\2\u0089"+
		"\34\3\2\2\2\u008a\u008b\7\61\2\2\u008b\u008c\7p\2\2\u008c\36\3\2\2\2\u008d"+
		"\u008e\7?\2\2\u008e\u008f\7@\2\2\u008f \3\2\2\2\u0090\u0092\t\3\2\2\u0091"+
		"\u0090\3\2\2\2\u0092\u0093\3\2\2\2\u0093\u0091\3\2\2\2\u0093\u0094\3\2"+
		"\2\2\u0094\u0095\3\2\2\2\u0095\u0096\b\21\2\2\u0096\"\3\2\2\2\b\2^o\u0081"+
		"\u0086\u0093\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}