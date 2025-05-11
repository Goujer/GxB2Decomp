namespace Org.BouncyCastle.Crypto.Parameters
{
	public class Gost3410ValidationParameters
	{
		private int x0;

		private int c;

		private long x0L;

		private long cL;

		public int C
		{
			get
			{
				return 0;
			}
		}

		public int X0
		{
			get
			{
				return 0;
			}
		}

		public long CL
		{
			get
			{
				return 0L;
			}
		}

		public long X0L
		{
			get
			{
				return 0L;
			}
		}

		public Gost3410ValidationParameters(int x0, int c)
		{
		}

		public Gost3410ValidationParameters(long x0L, long cL)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
