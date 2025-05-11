using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class Gost3410PublicKeyParameters : Gost3410KeyParameters
	{
		private readonly BigInteger y;

		public BigInteger Y
		{
			get
			{
				return null;
			}
		}

		public Gost3410PublicKeyParameters(BigInteger y, Gost3410Parameters parameters)
			: base(false, (Gost3410Parameters)null)
		{
		}

		public Gost3410PublicKeyParameters(BigInteger y, DerObjectIdentifier publicKeyParamSet)
			: base(false, (Gost3410Parameters)null)
		{
		}
	}
}
