using System.IO;
using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Asn1.X509;
using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Security
{
	public sealed class PublicKeyFactory
	{
		private PublicKeyFactory()
		{
		}

		public static AsymmetricKeyParameter CreateKey(byte[] keyInfoData)
		{
			return null;
		}

		public static AsymmetricKeyParameter CreateKey(Stream inStr)
		{
			return null;
		}

		public static AsymmetricKeyParameter CreateKey(SubjectPublicKeyInfo keyInfo)
		{
			return null;
		}

		private static bool IsPkcsDHParam(Asn1Sequence seq)
		{
			return false;
		}

		private static DHPublicKeyParameters ReadPkcsDHParam(DerObjectIdentifier algOid, BigInteger y, Asn1Sequence seq)
		{
			return null;
		}
	}
}
