namespace Org.BouncyCastle.Asn1.Pkcs
{
	public class ContentInfo : Asn1Encodable
	{
		private readonly DerObjectIdentifier contentType;

		private readonly Asn1Encodable content;

		public DerObjectIdentifier ContentType
		{
			get
			{
				return null;
			}
		}

		public Asn1Encodable Content
		{
			get
			{
				return null;
			}
		}

		private ContentInfo(Asn1Sequence seq)
		{
		}

		public ContentInfo(DerObjectIdentifier contentType, Asn1Encodable content)
		{
		}

		public static ContentInfo GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
