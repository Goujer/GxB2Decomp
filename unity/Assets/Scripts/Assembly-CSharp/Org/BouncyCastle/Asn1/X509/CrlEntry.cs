namespace Org.BouncyCastle.Asn1.X509
{
	public class CrlEntry : Asn1Encodable
	{
		internal Asn1Sequence seq;

		internal DerInteger userCertificate;

		internal Time revocationDate;

		internal X509Extensions crlEntryExtensions;

		public DerInteger UserCertificate
		{
			get
			{
				return null;
			}
		}

		public Time RevocationDate
		{
			get
			{
				return null;
			}
		}

		public X509Extensions Extensions
		{
			get
			{
				return null;
			}
		}

		public CrlEntry(Asn1Sequence seq)
		{
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
