using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Paddings
{
	public class TbcPadding : IBlockCipherPadding
	{
		public string PaddingName
		{
			get
			{
				return null;
			}
		}

		public virtual void Init(SecureRandom random)
		{
		}

		public virtual int AddPadding(byte[] input, int inOff)
		{
			return 0;
		}

		public virtual int PadCount(byte[] input)
		{
			return 0;
		}
	}
}
