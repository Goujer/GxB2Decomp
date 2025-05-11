using System.IO;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class HeartbeatExtension
	{
		protected readonly byte mMode;

		public virtual byte Mode
		{
			get
			{
				return 0;
			}
		}

		public HeartbeatExtension(byte mode)
		{
		}

		public virtual void Encode(Stream output)
		{
		}

		public static HeartbeatExtension Parse(Stream input)
		{
			return null;
		}
	}
}
