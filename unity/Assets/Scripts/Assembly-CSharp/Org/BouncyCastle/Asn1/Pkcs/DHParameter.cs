using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Asn1.Pkcs
{
	public class DHParameter : Asn1Encodable
	{
		internal DerInteger p;

		internal DerInteger g;

		internal DerInteger l;

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

		public BigInteger L
		{
			get
			{
				return null;
			}
		}

		public DHParameter(BigInteger p, BigInteger g, int l)
		{
		}

		public DHParameter(Asn1Sequence seq)
		{
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
