using System.Text;

namespace HTMLEngine.Core
{
	internal class Reader
	{
		public static readonly Reader Instance;

		public bool AutoSkipMLComments;

		public bool AutoSkipSLComments;

		public bool AutoSkipWhitespace;

		private string text;

		private int begin;

		private int end;

		private int curr;

		private readonly StringBuilder sb;

		public string CurrentText
		{
			get
			{
				return null;
			}
		}

		public bool IsEof
		{
			get
			{
				return false;
			}
		}

		public long Length
		{
			get
			{
				return 0L;
			}
		}

		public long Position
		{
			get
			{
				return 0L;
			}
		}

		public long Rest
		{
			get
			{
				return 0L;
			}
		}

		public char CurrChar
		{
			get
			{
				return '\0';
			}
		}

		public char NextChar
		{
			get
			{
				return '\0';
			}
		}

		public char PrevChar
		{
			get
			{
				return '\0';
			}
		}

		public void SetSource(string text)
		{
		}

		private void DoAutoSkip()
		{
		}

		public bool SkipToChar(char c, bool thenSkipThisChar = true)
		{
			return false;
		}

		public void Skip(int count)
		{
		}

		public bool SkipWhitespace()
		{
			return false;
		}

		public string ReadToStopChar(char stopChar, bool ignoreCase = false)
		{
			return null;
		}

		public string ReadToStopChar(char[] chars, bool ignoreCase = false)
		{
			return null;
		}

		public string ReadToStopText(string stopText, bool ignoreCase = false)
		{
			return null;
		}

		public string ReadToWhitespace()
		{
			return null;
		}

		public string ReadToWhitespaceOrChar(char c)
		{
			return null;
		}

		public string ReadQuotedString()
		{
			return null;
		}

		public bool IsOnSLComments()
		{
			return false;
		}

		public bool IsOnMLComments()
		{
			return false;
		}

		public bool IsOnWhitespace()
		{
			return false;
		}

		public bool IsOnQuote()
		{
			return false;
		}

		public bool IsOnDigit()
		{
			return false;
		}

		public bool IsOnLetter()
		{
			return false;
		}

		public bool IsOnLetterOrDigit()
		{
			return false;
		}

		public bool IsOnChar(char c, bool ignoreCase = false)
		{
			return false;
		}

		public bool IsOnChar(char[] chars, bool ignoreCase = false)
		{
			return false;
		}

		public bool IsOnText(string text, bool ignoreCase = false)
		{
			return false;
		}

		private static bool CompareChars(char c1, char c2, bool ignoreCase)
		{
			return false;
		}
	}
}
