using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Engines
{
	internal class RsaCoreEngine
	{
		private RsaKeyParameters key;

		private bool forEncryption;

		private int bitSize;

		public virtual void Init(bool forEncryption, ICipherParameters parameters)
		{
		}

		public virtual int GetInputBlockSize()
		{
			return 0;
		}

		public virtual int GetOutputBlockSize()
		{
			return 0;
		}

		public virtual BigInteger ConvertInput(byte[] inBuf, int inOff, int inLen)
		{
			return null;
		}

		public virtual byte[] ConvertOutput(BigInteger result)
		{
			return null;
		}

		public virtual BigInteger ProcessBlock(BigInteger input)
		{
			return null;
		}
	}
}
