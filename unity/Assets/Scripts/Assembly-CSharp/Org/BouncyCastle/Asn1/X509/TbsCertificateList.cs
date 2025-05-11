using System.Collections;

namespace Org.BouncyCastle.Asn1.X509
{
	public class TbsCertificateList : Asn1Encodable
	{
		private class RevokedCertificatesEnumeration : IEnumerable
		{
			private class RevokedCertificatesEnumerator : IEnumerator
			{
				private readonly IEnumerator e;

				public object Current
				{
					get
					{
						return null;
					}
				}

				internal RevokedCertificatesEnumerator(IEnumerator e)
				{
				}

				public bool MoveNext()
				{
					return false;
				}

				public void Reset()
				{
				}
			}

			private readonly IEnumerable en;

			internal RevokedCertificatesEnumeration(IEnumerable en)
			{
			}

			public IEnumerator GetEnumerator()
			{
				return null;
			}
		}

		internal Asn1Sequence seq;

		internal DerInteger version;

		internal AlgorithmIdentifier signature;

		internal X509Name issuer;

		internal Time thisUpdate;

		internal Time nextUpdate;

		internal Asn1Sequence revokedCertificates;

		internal X509Extensions crlExtensions;

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

		public X509Extensions Extensions
		{
			get
			{
				return null;
			}
		}

		internal TbsCertificateList(Asn1Sequence seq)
		{
		}

		public static TbsCertificateList GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static TbsCertificateList GetInstance(object obj)
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

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
