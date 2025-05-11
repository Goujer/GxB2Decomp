using System.Collections;
using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Crypto;

namespace Org.BouncyCastle.Security
{
	public sealed class MacUtilities
	{
		private static readonly IDictionary algorithms;

		private MacUtilities()
		{
		}

		static MacUtilities()
		{
		}

		public static IMac GetMac(DerObjectIdentifier id)
		{
			return null;
		}

		public static IMac GetMac(string algorithm)
		{
			return null;
		}

		public static string GetAlgorithmName(DerObjectIdentifier oid)
		{
			return null;
		}

		public static byte[] CalculateMac(string algorithm, ICipherParameters cp, byte[] input)
		{
			return null;
		}

		public static byte[] DoFinal(IMac mac)
		{
			return null;
		}

		public static byte[] DoFinal(IMac mac, byte[] input)
		{
			return null;
		}
	}
}
