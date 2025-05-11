using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class DHParameters : ICipherParameters
	{
		private const int DefaultMinimumLength = 160;

		private readonly BigInteger p;

		private readonly BigInteger g;

		private readonly BigInteger q;

		private readonly BigInteger j;

		private readonly int m;

		private readonly int l;

		private readonly DHValidationParameters validation;

		public BigInteger P
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

		public BigInteger Q
		{
			get
			{
				return null;
			}
		}

		public BigInteger J
		{
			get
			{
				return null;
			}
		}

		public int M
		{
			get
			{
				return 0;
			}
		}

		public int L
		{
			get
			{
				return 0;
			}
		}

		public DHValidationParameters ValidationParameters
		{
			get
			{
				return null;
			}
		}

		public DHParameters(BigInteger p, BigInteger g)
		{
		}

		public DHParameters(BigInteger p, BigInteger g, BigInteger q)
		{
		}

		public DHParameters(BigInteger p, BigInteger g, BigInteger q, int l)
		{
		}

		public DHParameters(BigInteger p, BigInteger g, BigInteger q, int m, int l)
		{
		}

		public DHParameters(BigInteger p, BigInteger g, BigInteger q, BigInteger j, DHValidationParameters validation)
		{
		}

		public DHParameters(BigInteger p, BigInteger g, BigInteger q, int m, int l, BigInteger j, DHValidationParameters validation)
		{
		}

		private static int GetDefaultMParam(int lParam)
		{
			return 0;
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected virtual bool Equals(DHParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
