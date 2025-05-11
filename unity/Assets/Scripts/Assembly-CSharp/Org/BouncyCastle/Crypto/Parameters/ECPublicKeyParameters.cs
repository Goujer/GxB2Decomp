using System;
using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Math.EC;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class ECPublicKeyParameters : ECKeyParameters
	{
		private readonly ECPoint q;

		public ECPoint Q
		{
			get
			{
				return null;
			}
		}

		public ECPublicKeyParameters(ECPoint q, ECDomainParameters parameters)
			: base((string)null, false, (ECDomainParameters)null)
		{
		}

		[Obsolete]
		public ECPublicKeyParameters(ECPoint q, DerObjectIdentifier publicKeyParamSet)
			: base((string)null, false, (ECDomainParameters)null)
		{
		}

		public ECPublicKeyParameters(string algorithm, ECPoint q, ECDomainParameters parameters)
			: base((string)null, false, (ECDomainParameters)null)
		{
		}

		public ECPublicKeyParameters(string algorithm, ECPoint q, DerObjectIdentifier publicKeyParamSet)
			: base((string)null, false, (ECDomainParameters)null)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		protected bool Equals(ECPublicKeyParameters other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
