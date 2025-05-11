using System.Collections;

namespace Org.BouncyCastle.Utilities.Collections
{
	public sealed class EmptyEnumerator : IEnumerator
	{
		public static readonly IEnumerator Instance;

		public object Current
		{
			get
			{
				return null;
			}
		}

		private EmptyEnumerator()
		{
		}

		public bool MoveNext()
		{
			return false;
		}

		public void Reset()
		{
		}
	}
}
