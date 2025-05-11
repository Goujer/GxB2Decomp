using System;
using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Asn1.X509;
using Org.BouncyCastle.Utilities.Collections;

namespace Org.BouncyCastle.X509
{
	public abstract class X509ExtensionBase : IX509Extension
	{
		protected abstract X509Extensions GetX509Extensions();

		protected virtual ISet GetExtensionOids(bool critical)
		{
			return null;
		}

		public virtual ISet GetNonCriticalExtensionOids()
		{
			return null;
		}

		public virtual ISet GetCriticalExtensionOids()
		{
			return null;
		}

		[Obsolete]
		public Asn1OctetString GetExtensionValue(string oid)
		{
			return null;
		}

		public virtual Asn1OctetString GetExtensionValue(DerObjectIdentifier oid)
		{
			return null;
		}
	}
}
