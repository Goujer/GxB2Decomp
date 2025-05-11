using System.Collections;

namespace Org.BouncyCastle.Asn1.X509
{
	public class CertificateList : Asn1Encodable
	{
		private readonly TbsCertificateList tbsCertList;

		private readonly AlgorithmIdentifier sigAlgID;

		private readonly DerBitString sig;

		public TbsCertificateList TbsCertList
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

		public int Version
		{
			get
			{
				return 0;
			}
		}

		public X509Name Issuer
		{
			get
			{
				return null;
			}
		}

		public Time ThisUpdate
		{
			get
			{
				return null;
			}
		}

		public Time NextUpdate
		{
			get
			{
				return null;
			}
		}

		private CertificateList(Asn1Sequence seq)
		{
		}

		public static CertificateList GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static CertificateList GetInstance(object obj)
		{
			return null;
		}

		public CrlEntry[] GetRevokedCertificates()
		{
			return null;
		}

		public IEnumerable GetRevokedCertificateEnumeration()
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
