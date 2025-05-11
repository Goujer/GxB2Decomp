using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class Gost3410PrivateKeyParameters : Gost3410KeyParameters
	{
		private readonly BigInteger x;

		public BigInteger X
		{
			get
			{
				return null;
			}
		}

		public Gost3410PrivateKeyParameters(BigInteger x, Gost3410Parameters parameters)
			: base(false, (Gost3410Parameters)null)
		{
		}

		public Gost3410PrivateKeyParameters(BigInteger x, DerObjectIdentifier publicKeyParamSet)
			: base(false, (Gost3410Parameters)null)
		{
		}
	}
}
