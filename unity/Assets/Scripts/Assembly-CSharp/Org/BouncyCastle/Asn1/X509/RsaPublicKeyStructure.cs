using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Asn1.X509
{
	public class RsaPublicKeyStructure : Asn1Encodable
	{
		private BigInteger modulus;

		private BigInteger publicExponent;

		public BigInteger Modulus
		{
			get
			{
				return null;
			}
		}

		public BigInteger PublicExponent
		{
			get
			{
				return null;
			}
		}

		public RsaPublicKeyStructure(BigInteger modulus, BigInteger publicExponent)
		{
		}

		private RsaPublicKeyStructure(Asn1Sequence seq)
		{
		}

		public static RsaPublicKeyStructure GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static RsaPublicKeyStructure GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
