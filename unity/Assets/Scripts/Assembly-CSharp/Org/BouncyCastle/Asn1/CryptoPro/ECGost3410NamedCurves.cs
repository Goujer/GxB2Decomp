using System.Collections;
using Org.BouncyCastle.Crypto.Parameters;

namespace Org.BouncyCastle.Asn1.CryptoPro
{
	public sealed class ECGost3410NamedCurves
	{
		internal static readonly IDictionary objIds;

		internal static readonly IDictionary parameters;

		internal static readonly IDictionary names;

		public static IEnumerable Names
		{
			get
			{
				return null;
			}
		}

		private ECGost3410NamedCurves()
		{
		}

		static ECGost3410NamedCurves()
		{
		}

		public static ECDomainParameters GetByOid(DerObjectIdentifier oid)
		{
			return null;
		}

		public static ECDomainParameters GetByName(string name)
		{
			return null;
		}

		public static string GetName(DerObjectIdentifier oid)
		{
			return null;
		}

		public static DerObjectIdentifier GetOid(string name)
		{
			return null;
		}
	}
}
