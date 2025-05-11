using System.Collections;

namespace Org.BouncyCastle.Utilities.Collections
{
	public sealed class EmptyEnumerable : IEnumerable
	{
		public static readonly IEnumerable Instance;

		private EmptyEnumerable()
		{
		}

		public IEnumerator GetEnumerator()
		{
			return null;
		}
	}
}
