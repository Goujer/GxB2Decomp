using System.Collections;
using Org.BouncyCastle.Asn1.X9;

namespace Org.BouncyCastle.Asn1.Nist
{
	public sealed class NistNamedCurves
	{
		private static readonly IDictionary objIds;

		private static readonly IDictionary names;

		public static IEnumerable Names
		{
			get
			{
				return null;
			}
		}

		private NistNamedCurves()
		{
		}

		static NistNamedCurves()
		{
		}

		private static void DefineCurveAlias(string name, DerObjectIdentifier oid)
		{
		}

		public static X9ECParameters GetByName(string name)
		{
			return null;
		}

		public static X9ECParameters GetByOid(DerObjectIdentifier oid)
		{
			return null;
		}

		public static DerObjectIdentifier GetOid(string name)
		{
			return null;
		}

		public static string GetName(DerObjectIdentifier oid)
		{
			return null;
		}
	}
}
