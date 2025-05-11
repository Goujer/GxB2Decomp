using Org.BouncyCastle.Math;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class RsaKeyGenerationParameters : KeyGenerationParameters
	{
		private readonly BigInteger publicExponent;

		private readonly int certainty;

		public BigInteger PublicExponent
		{
			get
			{
				return null;
			}
		}

		public int Certainty
		{
			get
			{
				return 0;
			}
		}

		public RsaKeyGenerationParameters(BigInteger publicExponent, SecureRandom random, int strength, int certainty)
			: base(null, 0)
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
