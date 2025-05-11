using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class Gost3410Parameters : ICipherParameters
	{
		private readonly BigInteger p;

		private readonly BigInteger q;

		private readonly BigInteger a;

		private readonly Gost3410ValidationParameters validation;

		public BigInteger P
		{
			get
			{
				return null;
			}
		}

		public BigInteger Q
		{
			get
			{
				return null;
			}
		}

		public BigInteger A
		{
			get
			{
				return null;
			}
		}

		public Gost3410ValidationParameters ValidationParameters
		{
			get
			{
				return null;
			}
		}

		public Gost3410Parameters(BigInteger p, BigInteger q, BigInteger a)
		{
		}

		public Gost3410Parameters(BigInteger p, BigInteger q, BigInteger a, Gost3410ValidationParameters validation)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(Gost3410Parameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
