namespace Org.BouncyCastle.Crypto.Engines
{
	public class ChaCha7539Engine : Salsa20Engine
	{
		public override string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		protected override int NonceSize
		{
			get
			{
				return 0;
			}
		}

		protected override void AdvanceCounter()
		{
		}

		protected override void ResetCounter()
		{
		}

		protected override void SetKey(byte[] keyBytes, byte[] ivBytes)
		{
		}

		protected override void GenerateKeyStream(byte[] output)
		{
		}
	}
}
