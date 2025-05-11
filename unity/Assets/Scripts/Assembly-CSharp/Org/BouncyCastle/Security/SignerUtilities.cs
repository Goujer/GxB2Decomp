using System.Collections;
using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Crypto;

namespace Org.BouncyCastle.Security
{
	public sealed class SignerUtilities
	{
		internal static readonly IDictionary algorithms;

		internal static readonly IDictionary oids;

		public static ICollection Algorithms
		{
			get
			{
				return null;
			}
		}

		private SignerUtilities()
		{
		}

		static SignerUtilities()
		{
		}

		public static DerObjectIdentifier GetObjectIdentifier(string mechanism)
		{
			return null;
		}

		public static Asn1Encodable GetDefaultX509Parameters(DerObjectIdentifier id)
		{
			return null;
		}

		public static Asn1Encodable GetDefaultX509Parameters(string algorithm)
		{
			return null;
		}

		private static Asn1Encodable GetPssX509Parameters(string digestName)
		{
			return null;
		}

		public static ISigner GetSigner(DerObjectIdentifier id)
		{
			return null;
		}

		public static ISigner GetSigner(string algorithm)
		{
			return null;
		}

		public static string GetEncodingName(DerObjectIdentifier oid)
		{
			return null;
		}
	}
}
