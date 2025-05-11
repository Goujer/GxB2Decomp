namespace Org.BouncyCastle.Asn1.X509
{
	public class X509CertificateStructure : Asn1Encodable
	{
		private readonly TbsCertificateStructure tbsCert;

		private readonly AlgorithmIdentifier sigAlgID;

		private readonly DerBitString sig;

		public TbsCertificateStructure TbsCertificate
		{
			get
			{
				return null;
			}
		}

		public int Version
		{
			get
			{
				return 0;
			}
		}

		public DerInteger SerialNumber
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

		public AlgorithmIdentifier SignatureAlgorithm
		{
			get
			{
				return null;
			}
		}

		public DerBitString Signature
		{
			get
			{
				return null;
			}
		}

		public X509CertificateStructure(TbsCertificateStructure tbsCert, AlgorithmIdentifier sigAlgID, DerBitString sig)
		{
		}

		private X509CertificateStructure(Asn1Sequence seq)
		{
		}

		public static X509CertificateStructure GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static X509CertificateStructure GetInstance(object obj)
		{
			return null;
		}

		public byte[] GetSignatureOctets()
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
