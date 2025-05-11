using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public abstract class ECKeyParameters : AsymmetricKeyParameter
	{
		private static readonly string[] algorithms;

		private readonly string algorithm;

		private readonly ECDomainParameters parameters;

		private readonly DerObjectIdentifier publicKeyParamSet;

		public string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public ECDomainParameters Parameters
		{
			get
			{
				return null;
			}
		}

		public DerObjectIdentifier PublicKeyParamSet
		{
			get
			{
				return null;
			}
		}

		protected ECKeyParameters(string algorithm, bool isPrivate, ECDomainParameters parameters)
			: base(false)
		{
		}

		protected ECKeyParameters(string algorithm, bool isPrivate, DerObjectIdentifier publicKeyParamSet)
			: base(false)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(ECKeyParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}

		internal ECKeyGenerationParameters CreateKeyGenerationParameters(SecureRandom random)
		{
			return null;
		}

		internal static string VerifyAlgorithmName(string algorithm)
		{
			return null;
		}

		internal static ECDomainParameters LookupParameters(DerObjectIdentifier publicKeyParamSet)
		{
			return null;
		}
	}
}
