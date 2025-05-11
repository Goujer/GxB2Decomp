using Org.BouncyCastle.Asn1;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public abstract class Gost3410KeyParameters : AsymmetricKeyParameter
	{
		private readonly Gost3410Parameters parameters;

		private readonly DerObjectIdentifier publicKeyParamSet;

		public Gost3410Parameters Parameters
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

		protected Gost3410KeyParameters(bool isPrivate, Gost3410Parameters parameters)
			: base(false)
		{
		}

		protected Gost3410KeyParameters(bool isPrivate, DerObjectIdentifier publicKeyParamSet)
			: base(false)
		{
		}

		private static Gost3410Parameters LookupParameters(DerObjectIdentifier publicKeyParamSet)
		{
			return null;
		}
	}
}
