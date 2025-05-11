using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class DsaParameters : ICipherParameters
	{
		private readonly BigInteger p;

		private readonly BigInteger q;

		private readonly BigInteger g;

		private readonly DsaValidationParameters validation;

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

		public BigInteger G
		{
			get
			{
				return null;
			}
		}

		public DsaValidationParameters ValidationParameters
		{
			get
			{
				return null;
			}
		}

		public DsaParameters(BigInteger p, BigInteger q, BigInteger g)
		{
		}

		public DsaParameters(BigInteger p, BigInteger q, BigInteger g, DsaValidationParameters parameters)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(DsaParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
