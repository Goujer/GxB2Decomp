using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;

namespace Bidi
{
	public class ArabicReshaper
	{
		[StructLayout(LayoutKind.Sequential, Size = 8)]
		private struct OutputStruct
		{
			public char letter;

			public int form;

			public OutputStruct(char letter, int form)
			{
				this.letter = '\0';
				this.form = 0;
			}
		}

		private const int UNSHAPED = 255;

		private const int ISOLATED = 0;

		private const int INITIAL = 1;

		private const int MEDIAL = 2;

		private const int FINAL = 3;

		private const char EMPTY_CHAR = '\u0001';

		private const char TATWEEL = 'ـ';

		private const char ZWJ = '\u200d';

		private static Regex __ligatures_re;

		private static Dictionary<int, List<string>> _re_group_index_to_ligature_forms;

		public static bool delete_harakat;

		public static bool delete_tatweel;

		public static bool support_zwj;

		public static bool shift_harakat_position;

		public static bool use_unshaped_instead_of_isolated;

		public static bool support_ligatures;

		private static readonly Dictionary<string, ArrayList> LIGATURES;

		private static readonly Dictionary<char, char[]> LETTERS;

		private static readonly Regex HARAKAT_RE;

		public static Regex ligatures_re
		{
			get
			{
				return null;
			}
		}

		public static List<string> get_ligature_forms_from_re_group_index(int group_index)
		{
			return null;
		}

		private static bool Connects_with_letter_before(char letter)
		{
			return false;
		}

		private static bool Connects_with_letter_after(char letter)
		{
			return false;
		}

		private static bool Connects_with_letters_before_and_after(char letter)
		{
			return false;
		}

		public static string Reshape(string text)
		{
			return null;
		}
	}
}
