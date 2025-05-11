using System.Collections;

namespace Org.BouncyCastle.Asn1.X9
{
	public class ECNamedCurveTable
	{
		public static IEnumerable Names
		{
			get
			{
				return null;
			}
		}

		public static X9ECParameters GetByName(string name)
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

		public static X9ECParameters GetByOid(DerObjectIdentifier oid)
		{
			return null;
		}
	}
}
