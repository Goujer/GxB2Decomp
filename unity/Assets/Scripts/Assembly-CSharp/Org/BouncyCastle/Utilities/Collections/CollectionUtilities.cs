using System;
using System.Collections;

namespace Org.BouncyCastle.Utilities.Collections
{
	public abstract class CollectionUtilities
	{
		public static void AddRange(IList to, IEnumerable range)
		{
		}

		public static bool CheckElementsAreOfType(IEnumerable e, Type t)
		{
			return false;
		}

		public static IDictionary ReadOnly(IDictionary d)
		{
			return null;
		}

		public static IList ReadOnly(IList l)
		{
			return null;
		}

		public static ISet ReadOnly(ISet s)
		{
			return null;
		}

		public static string ToString(IEnumerable c)
		{
			return null;
		}
	}
}
