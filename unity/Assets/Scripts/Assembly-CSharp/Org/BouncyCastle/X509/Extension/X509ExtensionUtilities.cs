using System.Collections;
using Org.BouncyCastle.Asn1;

namespace Org.BouncyCastle.X509.Extension
{
	public class X509ExtensionUtilities
	{
		public static Asn1Object FromExtensionValue(Asn1OctetString extensionValue)
		{
			return null;
		}

		public static ICollection GetIssuerAlternativeNames(X509Certificate cert)
		{
			return null;
		}

		public static ICollection GetSubjectAlternativeNames(X509Certificate cert)
		{
			return null;
		}

		private static ICollection GetAlternativeName(Asn1OctetString extVal)
		{
			return null;
		}
	}
}
