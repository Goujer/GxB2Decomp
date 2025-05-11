using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Asn1.X509
{
	public class DsaParameter : Asn1Encodable
	{
		internal readonly DerInteger p;

		internal readonly DerInteger q;

		internal readonly DerInteger g;

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

		public DsaParameter(BigInteger p, BigInteger q, BigInteger g)
		{
		}

		private DsaParameter(Asn1Sequence seq)
		{
		}

		public static DsaParameter GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static DsaParameter GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
