using System.IO;
using Org.BouncyCastle.Crypto.Parameters;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class ServerDHParams
	{
		protected readonly DHPublicKeyParameters mPublicKey;

		public virtual DHPublicKeyParameters PublicKey
		{
			get
			{
				return null;
			}
		}

		public ServerDHParams(DHPublicKeyParameters publicKey)
		{
		}

		public virtual void Encode(Stream output)
		{
		}

		public static ServerDHParams Parse(Stream input)
		{
			return null;
		}
	}
}
