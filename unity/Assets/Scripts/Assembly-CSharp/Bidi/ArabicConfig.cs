using System.Collections.Generic;

namespace Bidi
{
	public static class ArabicConfig
	{
		public const string language = "Arabic";

		public const bool delete_harakat = true;

		public const bool shift_harakat_position = false;

		public const bool delete_tatweel = false;

		public const bool support_zwj = true;

		public const bool use_unshaped_instead_of_isolated = false;

		public const bool support_ligatures = true;

		public static readonly Dictionary<string, bool> LigaturesConf;
	}
}
