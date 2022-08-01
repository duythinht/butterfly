{
    new()::{
        addTransformation(trans):: self {} + {
            transformations+: [
                trans
            ],
        }
    }
}