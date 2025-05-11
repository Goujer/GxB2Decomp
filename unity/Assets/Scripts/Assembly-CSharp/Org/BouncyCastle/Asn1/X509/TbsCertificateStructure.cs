namespace Org.BouncyCastle.Asn1.X509
{
	public class TbsCertificateStructure : Asn1Encodable
	{
		internal Asn1Sequence seq;

		internal DerInteger version;

		internal DerInteger serialNumber;

		internal AlgorithmIdentifier signature;

		internal X509Name issuer;

		internal Time startDate;

		internal Time endDate;

		internal X509Name subject;

		internal SubjectPublicKeyInfo subjectPublicKeyInfo;

		internal DerBitString issuerUniqueID;

		internal DerBitString subjectUniqueID;

		internal X509Extensions extensions;

		public int Version
		{
			get
			{
				return 0;
			}
		}

		public DerInteger VersionNumber
		{
			get
			{
				return null;
			}
		}

		public DerInteger SerialNumber
		{
			get
			{
				return null;
			}
		}

		public AlgorithmIdentifier Signature
		{
			get
			{
				return null;
			}
		}

		public X509Name Issuer
		{
			get
			{
				return null;
			}
		}

		public Time StartDate
		{
			get
			{
				return null;
			}
		}

		public Time EndDate
		{
			get
			{
				return null;
			}
		}

		public X509Name Subject
		{
			get
			{
				return null;
			}
		}

		public SubjectPublicKeyInfo SubjectPublicKeyInfo
		{
			get
			{
				return null;
			}
		}

		public DerBitString IssuerUniqueID
		{
			get
			{
				return null;
			}
		}

		public DerBitString SubjectUniqueID
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

		internal TbsCertificateStructure(Asn1Sequence seq)
		{
		}

		public static TbsCertificateStructure GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static TbsCertificateStructure GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
