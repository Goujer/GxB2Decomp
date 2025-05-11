using System.Text;

namespace Org.BouncyCastle.Asn1.X509
{
	public class DistributionPointName : Asn1Encodable, IAsn1Choice
	{
		internal readonly Asn1Encodable name;

		internal readonly int type;

		public const int FullName = 0;

		public const int NameRelativeToCrlIssuer = 1;

		public int PointType
		{
			get
			{
				return 0;
			}
		}

		public Asn1Encodable Name
		{
			get
			{
				return null;
			}
		}

		public DistributionPointName(int type, Asn1Encodable name)
		{
		}

		public DistributionPointName(GeneralNames name)
		{
		}

		public DistributionPointName(Asn1TaggedObject obj)
		{
		}

		public static DistributionPointName GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static DistributionPointName GetInstance(object obj)
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
