namespace Org.BouncyCastle.Asn1.Pkcs
{
	public class SignedData : Asn1Encodable
	{
		private readonly DerInteger version;

		private readonly Asn1Set digestAlgorithms;

		private readonly ContentInfo contentInfo;

		private readonly Asn1Set certificates;

		private readonly Asn1Set crls;

		private readonly Asn1Set signerInfos;

		public DerInteger Version
		{
			get
			{
				return null;
			}
		}

		public Asn1Set DigestAlgorithms
		{
			get
			{
				return null;
			}
		}

		public ContentInfo ContentInfo
		{
			get
			{
				return null;
			}
		}

		public Asn1Set Certificates
		{
			get
			{
				return null;
			}
		}

		public Asn1Set Crls
		{
			get
			{
				return null;
			}
		}

		public Asn1Set SignerInfos
		{
			get
			{
				return null;
			}
		}

		public SignedData(DerInteger _version, Asn1Set _digestAlgorithms, ContentInfo _contentInfo, Asn1Set _certificates, Asn1Set _crls, Asn1Set _signerInfos)
		{
		}

		private SignedData(Asn1Sequence seq)
		{
		}

		public static SignedData GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
