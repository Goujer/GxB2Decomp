namespace Org.BouncyCastle.Crypto.Engines
{
	public class Cast5Engine : IBlockCipher
	{
		internal static readonly uint[] S1;

		internal static readonly uint[] S2;

		internal static readonly uint[] S3;

		internal static readonly uint[] S4;

		internal static readonly uint[] S5;

		internal static readonly uint[] S6;

		internal static readonly uint[] S7;

		internal static readonly uint[] S8;

		internal static readonly int MAX_ROUNDS;

		internal static readonly int RED_ROUNDS;

		private const int BLOCK_SIZE = 8;

		private int[] _Kr;

		private uint[] _Km;

		private bool _encrypting;

		private byte[] _workingKey;

		private int _rounds;

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public virtual bool IsPartialBlockOkay
		{
			get
			{
				return false;
			}
		}

		public virtual void Init(bool forEncryption, ICipherParameters parameters)
		{
		}

		public virtual int ProcessBlock(byte[] input, int inOff, byte[] output, int outOff)
		{
			return 0;
		}

		public virtual void Reset()
		{
		}

		public virtual int GetBlockSize()
		{
			return 0;
		}

		internal virtual void SetKey(byte[] key)
		{
		}

		internal virtual int EncryptBlock(byte[] src, int srcIndex, byte[] dst, int dstIndex)
		{
			return 0;
		}

		internal virtual int DecryptBlock(byte[] src, int srcIndex, byte[] dst, int dstIndex)
		{
			return 0;
		}

		internal static uint F1(uint D, uint Kmi, int Kri)
		{
			return 0u;
		}

		internal static uint F2(uint D, uint Kmi, int Kri)
		{
			return 0u;
		}

		internal static uint F3(uint D, uint Kmi, int Kri)
		{
			return 0u;
		}

		internal void CAST_Encipher(uint L0, uint R0, uint[] result)
		{
		}

		internal void CAST_Decipher(uint L16, uint R16, uint[] result)
		{
		}

		internal static void Bits32ToInts(uint inData, int[] b, int offset)
		{
		}

		internal static uint IntsTo32bits(int[] b, int i)
		{
			return 0u;
		}
	}
}
