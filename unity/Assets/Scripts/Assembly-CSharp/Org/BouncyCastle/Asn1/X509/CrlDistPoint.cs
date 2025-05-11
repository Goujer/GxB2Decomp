namespace Org.BouncyCastle.Asn1.X509
{
	public class CrlDistPoint : Asn1Encodable
	{
		internal readonly Asn1Sequence seq;

		private CrlDistPoint(Asn1Sequence seq)
		{
		}

		public CrlDistPoint(DistributionPoint[] points)
		{
		}

		public static CrlDistPoint GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static CrlDistPoint GetInstance(object obj)
		{
			return null;
		}

		public DistributionPoint[] GetDistributionPoints()
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}

		public override string ToString()
		{
			return null;
		}
	}
}
