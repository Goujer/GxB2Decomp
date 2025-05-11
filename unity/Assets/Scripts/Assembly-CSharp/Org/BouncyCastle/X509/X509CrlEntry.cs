using System;
using Org.BouncyCastle.Asn1.X509;
using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.X509
{
	public class X509CrlEntry : X509ExtensionBase
	{
		private CrlEntry c;

		private bool isIndirect;

		private X509Name previousCertificateIssuer;

		private X509Name certificateIssuer;

		public BigInteger SerialNumber
		{
			get
			{
				return null;
			}
		}

		public DateTime RevocationDate
		{
			get
			{
				return default(DateTime);
			}
		}

		public bool HasExtensions
		{
			get
			{
				return false;
			}
		}

		public X509CrlEntry(CrlEntry c)
		{
		}

		public X509CrlEntry(CrlEntry c, bool isIndirect, X509Name previousCertificateIssuer)
		{
		}

		private X509Name loadCertificateIssuer()
		{
			return null;
		}

		public X509Name GetCertificateIssuer()
		{
			return null;
		}

		protected override X509Extensions GetX509Extensions()
		{
			return null;
		}

		public byte[] GetEncoded()
		{
			return null;
		}

		public override string ToString()
		{
			return null;
		}
	}
}
