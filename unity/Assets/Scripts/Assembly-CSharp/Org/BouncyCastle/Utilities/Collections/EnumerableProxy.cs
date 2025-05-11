using System.Collections;

namespace Org.BouncyCastle.Utilities.Collections
{
	public sealed class EnumerableProxy : IEnumerable
	{
		private readonly IEnumerable inner;

		public EnumerableProxy(IEnumerable inner)
		{
		}

		public IEnumerator GetEnumerator()
		{
			return null;
		}
	}
}
