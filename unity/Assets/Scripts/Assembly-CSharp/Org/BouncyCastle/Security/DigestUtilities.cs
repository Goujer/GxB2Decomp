using System.Collections;
using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Crypto;

namespace Org.BouncyCastle.Security
{
	public sealed class DigestUtilities
	{
		private enum DigestAlgorithm
		{
			GOST3411 = 0,
			KECCAK_224 = 1,
			KECCAK_256 = 2,
			KECCAK_288 = 3,
			KECCAK_384 = 4,
			KECCAK_512 = 5,
			MD2 = 6,
			MD4 = 7,
			MD5 = 8,
			RIPEMD128 = 9,
			RIPEMD160 = 10,
			RIPEMD256 = 11,
			RIPEMD320 = 12,
			SHA_1 = 13,
			SHA_224 = 14,
			SHA_256 = 15,
			SHA_384 = 16,
			SHA_512 = 17,
			SHA_512_224 = 18,
			SHA_512_256 = 19,
			SHA3_224 = 20,
			SHA3_256 = 21,
			SHA3_384 = 22,
			SHA3_512 = 23,
			SHAKE128 = 24,
			SHAKE256 = 25,
			TIGER = 26,
			WHIRLPOOL = 27
		}

		private static readonly IDictionary algorithms;

		private static readonly IDictionary oids;

		public static ICollection Algorithms
		{
			get
			{
				return null;
			}
		}

		private DigestUtilities()
		{
		}

		static DigestUtilities()
		{
		}

		public static DerObjectIdentifier GetObjectIdentifier(string mechanism)
		{
			return null;
		}

		public static IDigest GetDigest(DerObjectIdentifier id)
		{
			return null;
		}

		public static IDigest GetDigest(string algorithm)
		{
			return null;
		}

		public static string GetAlgorithmName(DerObjectIdentifier oid)
		{
			return null;
		}

		public static byte[] CalculateDigest(string algorithm, byte[] input)
		{
			return null;
		}

		public static byte[] DoFinal(IDigest digest)
		{
			return null;
		}

		public static byte[] DoFinal(IDigest digest, byte[] input)
		{
			return null;
		}
	}
}
