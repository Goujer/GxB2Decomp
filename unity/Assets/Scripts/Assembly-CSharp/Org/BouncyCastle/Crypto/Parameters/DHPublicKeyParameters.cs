using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class DHPublicKeyParameters : DHKeyParameters
	{
		private readonly BigInteger y;

		public BigInteger Y
		{
			get
			{
				return null;
			}
		}

		public DHPublicKeyParameters(BigInteger y, DHParameters parameters)
			: base(false, null)
		{
		}

		public DHPublicKeyParameters(BigInteger y, DHParameters parameters, DerObjectIdentifier algorithmOid)
			: base(false, null)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(DHPublicKeyParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
