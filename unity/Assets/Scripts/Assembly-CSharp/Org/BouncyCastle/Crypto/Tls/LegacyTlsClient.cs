using System;
using System.Collections.Generic;

namespace Org.BouncyCastle.Crypto.Tls
{
	public sealed class LegacyTlsClient : DefaultTlsClient
	{
		private readonly Uri TargetUri;

		private readonly ICertificateVerifyer verifyer;

		private readonly IClientCredentialsProvider credProvider;

		public LegacyTlsClient(Uri targetUri, ICertificateVerifyer verifyer, IClientCredentialsProvider prov, List<string> hostNames)
		{
		}

		public override TlsAuthentication GetAuthentication()
		{
			return null;
		}
	}
}
