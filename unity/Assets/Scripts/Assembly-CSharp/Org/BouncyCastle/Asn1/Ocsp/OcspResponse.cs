namespace Org.BouncyCastle.Asn1.Ocsp
{
	public class OcspResponse : Asn1Encodable
	{
		private readonly OcspResponseStatus responseStatus;

		private readonly ResponseBytes responseBytes;

		public OcspResponseStatus ResponseStatus
		{
			get
			{
				return null;
			}
		}

		public ResponseBytes ResponseBytes
		{
			get
			{
				return null;
			}
		}

		public OcspResponse(OcspResponseStatus responseStatus, ResponseBytes responseBytes)
		{
		}

		private OcspResponse(Asn1Sequence seq)
		{
		}

		public static OcspResponse GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static OcspResponse GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
