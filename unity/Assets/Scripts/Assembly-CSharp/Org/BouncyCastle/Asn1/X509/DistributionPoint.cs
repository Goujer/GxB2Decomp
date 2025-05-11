using System.Text;

namespace Org.BouncyCastle.Asn1.X509
{
	public class DistributionPoint : Asn1Encodable
	{
		internal readonly DistributionPointName distributionPoint;

		internal readonly ReasonFlags reasons;

		internal readonly GeneralNames cRLIssuer;

		public DistributionPointName DistributionPointName
		{
			get
			{
				return null;
			}
		}

		public ReasonFlags Reasons
		{
			get
			{
				return null;
			}
		}

		public GeneralNames CrlIssuer
		{
			get
			{
				return null;
			}
		}

		private DistributionPoint(Asn1Sequence seq)
		{
		}

		public DistributionPoint(DistributionPointName distributionPointName, ReasonFlags reasons, GeneralNames crlIssuer)
		{
		}

		public static DistributionPoint GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static DistributionPoint GetInstance(object obj)
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

		private void appendObject(StringBuilder buf, string sep, string name, string val)
		{
		}
	}
}
