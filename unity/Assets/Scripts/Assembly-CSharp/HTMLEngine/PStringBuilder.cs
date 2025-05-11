using System.Text;

namespace HTMLEngine
{
	internal class PStringBuilder : PoolableObject
	{
		private readonly StringBuilder sb;

		internal override void OnAcquire()
		{
		}

		internal override void OnRelease()
		{
		}

		public static implicit operator StringBuilder(PStringBuilder psb)
		{
			return null;
		}

		public void Append(char c)
		{
		}

		public void Append(string s)
		{
		}

		public override string ToString()
		{
			return null;
		}
	}
}
